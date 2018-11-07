const AWS = require('aws-sdk')

exports.handler = function (event, context, callback) {

    const documentclient = new AWS.DynamoDB.DocumentClient()

    const params = {
        TableName: 'Coffeeshop'
    }

    documentclient.scan(params, (err, data) => {
        if (err) {
            console.log(err, err.stack)

            let response = {
                statusCode: 500,
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(err, null, 2),
            }
            callback(response)
        }
        else {
            console.log(data)
            let response = {
                statusCode: 200,
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data.Items, null, 2),
            }
            callback(null, response)
        }
    })
}
