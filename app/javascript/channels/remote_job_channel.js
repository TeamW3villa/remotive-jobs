import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RemoteJobChannel" }, {
  connected() {
    console.log("connected to channel")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    if (data.content == undefined || null) {
      alert("data is not found")
    }
    else{
    // Called when there's incoming data on the websocket for this channel
    let template = data.content.map(x => {
      $('.messages').append('<tr><td>' + x.id + '</td><td>' + x.title + '</td><td>' + x.company_name + '</td><td>' + x.category + '</td><td>' + x.tags + '</td><td>' + x.job_type + '</td><td>' + x.candidate_required_location + '</td><td>' + x.salary + '</td></tr>')
    })
  }
}
});
