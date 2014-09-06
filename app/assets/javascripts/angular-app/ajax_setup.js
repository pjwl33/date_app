$.ajaxSetup({
  statusCode: {
    401: function(){
      location.href = "#/";
    }
  }
});