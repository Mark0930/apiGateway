const htmlpage = require(__dirname + '/index.html')
exports.handler = function (event, context, callback) {
    var response = {
        statusCode: 200,
        headers: {
            'Content-Type': 'text/html; charset=utf-8',
        },
        body: htmlpage,
    };
    callback(null, response);
};