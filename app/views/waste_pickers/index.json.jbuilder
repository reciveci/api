json.array!(@waste_pickers) do |waste_picker|
<<<<<<< HEAD
  json.extract! waste_picker, :id, :name, :fullName, :birth_date, :start_date, :background, :message, :routes
=======
  json.extract! waste_picker, :id, :name, :fullName, :gender, :birth_date, :start_date, :background, :message, :routes
>>>>>>> 549c2af834f6c0b36e0f6f595b174e4720bb12f2
  json.url waste_picker_url(waste_picker, format: :json)
end
