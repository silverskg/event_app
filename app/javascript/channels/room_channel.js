import consumer from "./consumer"

$(function(){

  const chatChannel = consumer.subscriptions.create({ channel: "RoomChannel", room: $('#messages').data('room_id')}, {

    connected(){

    },
    
    received: function(data) {
      return  $('#messages').append(data['message']);
    },

    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });

  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});
