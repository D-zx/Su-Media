# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Initial Data for Role
@admin = Role.create(name: "Admin")
@volunter = Role.create(name: "Volunter")
@student = Role.create(name: "Student")

# Admin
User.create(name: "Admin",
            studentid: "st1100000",
            email: "admin@ait.asia",
            password: "secret123",
            password_confirmation: "secret123",
            fos: "IM",
            ph: "+9595199516",
            gender: "male",
            role: @admin)
# Volunter
User.create(name: "Volunter",
            studentid: "st1100000",
            email: "volunter@ait.asia",
            password: "secret123",
            password_confirmation: "secret123",
            fos: "IM",
            ph: "+9595199516",
            gender: "male",
            role: @volunter)

# Student
User.create(name: "Student",
            studentid: "st1100000",
            email: "student@ait.asia",
            password: "secret123",
            password_confirmation: "secret123",
            fos: "IM",
            ph: "+9595199516",
            gender: "male",
            role: @student)