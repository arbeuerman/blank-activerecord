# Seed Your Database 

User.destroy_all
User.reset_pk_sequence

User.create(name: "Zech", username: "zech_loves_harry_potter", password: "123abc")
User.create(name: "Aiden", username: "aiden_wizard", password: "abc123")
User.create(name: "Alexandra", username: "alexandra_is_a_witch", password: "password")


