$(function(){
  $("#identification_postcode").jpostal({
    postcode : [ "#identification_postcode" ],
    address  : {
                  "#identification_prefecture_code" : "%3",
                  "#identification_city"            : "%4",
                  "#identification_address1"          : "%5%6%7"
                }
  })
})