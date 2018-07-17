# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
basic_level = AccessLevel.create(name: "Basic", level: 1)
entusiast_level = AccessLevel.create(name: "Entusiast", level: 2)
green_level = AccessLevel.create(name: "Green", level: 3)
pro_level = AccessLevel.create(name: "Pro", level: 4)
earth_saver_level = AccessLevel.create(name: "Eart Saver", level: 5)

codes = RegistrationCode.create([
    {code: "0000", access_level: basic_level},
    {code: "0001", access_level: basic_level},
    {code: "0002", access_level: basic_level},
    {code: "0003", access_level: basic_level},
    {code: "0004", access_level: basic_level},
    {code: "0005", access_level: entusiast_level},
    {code: "0006", access_level: entusiast_level},
    {code: "0007", access_level: entusiast_level},
    {code: "0008", access_level: entusiast_level},
    {code: "0009", access_level: entusiast_level},
    {code: "00010", access_level: green_level},
    {code: "00011", access_level: green_level},
    {code: "00012", access_level: green_level},
    {code: "00013", access_level: green_level},
    {code: "00014", access_level: green_level},
    {code: "00015", access_level: green_level},
    {code: "00016", access_level: pro_level},
    {code: "00017", access_level: pro_level},
    {code: "00018", access_level: pro_level},
    {code: "00019", access_level: pro_level},
    {code: "00020", access_level: earth_saver_level},
    {code: "00021", access_level: earth_saver_level},
    {code: "00022", access_level: earth_saver_level},
    {code: "00023", access_level: earth_saver_level},
    {code: "00024", access_level: earth_saver_level}
])

juan = User.create(email: "juanjoze0424@gmail.com", username: "juanzv", password: "asd123", first_name: "Juan", last_name: "Zenón", access_level: earth_saver_level, code: "00024")
juan.add_role(:admin)
