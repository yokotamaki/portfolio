class Review < ApplicationRecord
  belongs_to :room
  has_one :notification

  validates :star, presence: { message: "星を選択してください" }
  validates :name, presence: { message: "名前入力してください" }
  validates :age, presence: { message: "年代選択してください" }
  validates :sex, presence: { message: "性別を選択してください" }
  validates :room_id, presence: { message: "宿泊した部屋タイプを選択してください" }

  # レビュー絞り込み検索
  scope :review_search, -> (search_params) do
    return if search_params.blank?
    room_type_in(search_params[:room])
      .star_in(search_params[:star])
      .age_in(search_params[:age])
      .sex_in(search_params[:sex])
  end
  scope :room_type_in, -> (room) { where(room_id: room.map{|n| n.to_i}) if room.present? }
  scope :star_in, -> (star) { where(star: star) if star.present? }
  scope :age_in, -> (age) { where(age: age) if age.present? }
  scope :sex_in, -> (sex) { where(sex: sex) if sex.present? }
end