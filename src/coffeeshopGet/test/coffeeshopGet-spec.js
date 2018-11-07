/* eslint-env mocha */
const lambda = require('../index')
const { expect } = require('chai')
const dynamoResponses = require('./dynamoResponses')
const AWS = require('aws-sdk-mock')

describe('get coffee shop unit tests', () => {

    it('should return all coffeeshop objects', (done) => {

        AWS.mock('DynamoDB.DocumentClient', 'scan', function (params, callback) {
            callback(null, dynamoResponses.populatedResponse())
        })

        let expected = {
            statusCode: 200,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(dynamoResponses.populatedResponse().Items, null, 2)
        }

        lambda.handler(null, null, (err, result) => {
            if (err) {
                throw new Error("error", err)
            } else {
                console.log("result", result)
                expect(result).to.deep.equal(expected)
                done()
            }
        })
    })
})