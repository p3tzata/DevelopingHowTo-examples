var express = require('express');
var router = express.Router();

/* GET home page. */

router.get('/', function(req, res, next) {
  res.render('cu/index', { msg: 'Index Page' });
});
router.get('/authCallback', function(req, res, next) {
  res.render('cu/authCallback', { title: 'authCallback' });
});

module.exports = router;
