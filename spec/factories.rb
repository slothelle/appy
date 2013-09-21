FactoryGirl.define do
  factory :user do
    name          "user"
  end

  factory :comment do
    body          "comment"
  end

  factory :user_admin, parent: :user do
    name          "Suzy"
    email         "suzy@queue.com"
    password      "password123456"
    role          "admin"
  end

  factory :user_editor, parent: :user do
    name          "Suzy"
    email         "suzy1@queue.com"
    password      "password123456"
    role          "editor"
  end

  factory :user_tester, parent: :user do
    name          "Suzy"
    email         "suzy2@queue.com"
    password      "password123456"
    role          "tester"
  end

  # Makes a pattern without state and free since I need to tinker with these
  factory :pattern do
    name            "Wish I Was Weaving This Cowl"
    gauge           "16 sts and 24 rows per 4 in/10 cm, stockinette."
    yarn            "Wooly Wonka Fibers Brigit Worsted (100% merino; 181 yards/166 meters per 100 grams), shown in Forest Primeval."
    yarn_info       "Approximately 170 yards/155 meters worsted weight required for cowl; 400/366 for infinity cowl."
    needle          "US 8 (5.0mm) 16' circular needle."
    notions         "1 stitch marker, darning needle."
    description     "This quick and easy basketweave cowl can be knit in nearly any yarn weight, and is suitable for beginning knitters."
    finished_sizes  "Cowl: 20.5 in/52 cm circumference, 10.25 in/26 cm tall. Infinity: 60 in/152 cm circumference, 6.75 in/17 cm tall."
    version         "1"
  end

  factory :abbreviation do
    stitch          "k"
    definition       "knit"
    pattern
  end

  factory :section do
    title           "Set Up"
    number          "1"
    description     "Size-specific instructions are listed as follows: [ cowl, infinity ]. All instructions apply to both sizes unless otherwise stated."
    instructions    "Proceed to next section."
    pattern
  end

  factory :row do
    num             "1"
    instructions    "k all sts."
    stitch_count    "12"
    section
  end

  factory :image do
    photo_file_name "3.jpg"
    pattern
  end

  factory :chart do
    image_file_name "1.jpg"
    name            "Chart A"
    pattern
  end

  factory :chart_legend do
    image_file_name "2.jpg"
    pattern
  end

  factory :comment_admin, parent: :comment do
    body            "This looks horrible."
    confidence      "1"
    pattern
    association :user, factory: :user_admin
  end

  factory :comment_editor, parent: :comment do
    body            "This looks horrible."
    confidence      "1"
    pattern
    association :user, factory: :user_editor
  end

  factory :comment_tester, parent: :comment do
    body            "This looks horrible."
    confidence      "1"
    pattern
    association :user, factory: :user_tester
  end
end