data = {
  subject: 'Test ticket',
  comment: {
    value: 'This is a test'
  },
  submitter_id: $client.current_user.id,
  priority: 'normal'
}

$client.tickets.create!(data)
