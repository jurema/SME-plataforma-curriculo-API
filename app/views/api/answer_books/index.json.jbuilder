json.array! @answer_books do |answer_book|
  json.id answer_book.id
  json.name answer_book.name
  json.year answer_book.year.name
  json.curricular_component answer_book.curricular_component.name
  json.segment answer_book.segment.name
  json.stage  answer_book.stage.name
  json.cover_image "/assets/#{answer_book.cover_image_identifier}"
  json.book_file book_file_api_answer_book_path(answer_book.id)
end
