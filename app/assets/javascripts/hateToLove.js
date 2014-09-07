$(document).ready(function(){
  makeDraggable();
  var matches = $('.find-matches-wrap');
  matches.eq(0).css('visibility', 'visible');
  if (location.href == "http://localhost:3000/matches") {
    $('html body').css('overflow-y', 'scroll');
  }
});

function makeDraggable(){
  var matches = $('.find-matches-wrap');
  for (var i = 0; i < matches.length; i++){
    matches.eq(i).draggable({
      drag: function(event, ui){
        console.log($(this)[0].id);
      },
      revert: function(event, ui) {
        $(this).data("uiDraggable").originalPosition = {
          top : 0,
          left : 0
        };
        return !event;
      }
    });
  }
}

// function createSideSwipe(){
//   $('#hate-div').droppable({
//     drop: function(event, ui){
//       console.log($(this));
//     }
//   });
//   $('#love-div').droppable({
//     drop: function(event, ui){
//       console.log($(this));
//       makeMatch();
//     }
//   });
// }

function checkMatch(matchId, pick){
  // console.log(matchId);
  if (pick == 'hate'){
    nextPerson(matchId);
  } else if (pick == 'love'){
    sendMatchRequest(matchId);
  }
}

function sendMatchRequest(matchId){
  console.log("Sending match request...");
  $.ajax({
    method: 'POST',
    url: '/match_request',
    dataType: 'JSON',
    data: {match_id: matchId}
  }).done(function(data){
    console.log(data);
    nextPerson(matchId);
  });
}

function nextPerson(matchId){
  console.log("Moving onto the next person...");
  var allMatches = $('.find-matches-wrap');
  for (var i = 0; i < allMatches.length; i++){
    if (allMatches.eq(i).attr('id') == matchId){
      allMatches.eq(i).next().css('visibility', 'visible');
      allMatches.eq(i).remove();
    }
  }
}

function denyRequest(reqId){
  console.log(reqId);
  $.ajax({
    method: 'POST',
    url: '/match_deny_confirm',
    data: {match_id: reqId, type_of: 'deny'},
    dataType: 'JSON'
  }).done(function(data){
    console.log(data);
    hideMatch(data.id);
  });
}

function confirmRequest(reqId){
  $.ajax({
    method: 'POST',
    url: '/match_deny_confirm',
    data: {match_id: reqId, type_of: 'confirm'},
    dataType: 'JSON'
  }).done(function(data){
    console.log(data);
    hideMatch(data.id);
  });
}

function hideMatch(matchId){
  console.log(matchId);
  var allPIY = $('.piy-wrap');
  for (var i = 0; i < allPIY.length; i++){
    if (allPIY.eq(i).attr('id') == matchId){
      allPIY.eq(i).remove();
    }
  }
}

function startChat(matchId){
  console.log(matchId);
  $.ajax({
    method: 'GET',
    url: '/start_chatting',
    data: {match_id: matchId}
  }).done(function(data){
    console.log(data);
    location.href = "/chatrooms/" + data.id;
  });
}

function renderMessages(chatroomId){
  $.ajax({
    url: '/messages',
    method: 'GET',
    dataType: 'JSON',
    data: {chatroom_id: chatroomId}
  }).done(function(data){

  })
}

function addMessage(){

}


















