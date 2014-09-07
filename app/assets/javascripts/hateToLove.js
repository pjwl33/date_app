$(document).ready(function(){
  makeDraggable();
  createSideSwipe();
  var matches = $('.find-matches-wrap');
  matches.eq(0).css('visibility', 'visible');
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

function createSideSwipe(){
  $('#hate-div').droppable({
    drop: function(event, ui){
      console.log($(this));
    }
  });
  $('#love-div').droppable({
    drop: function(event, ui){
      console.log($(this));
      makeMatch();
    }
  });
}

function makeMatch(){

}