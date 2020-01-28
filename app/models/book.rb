class Book < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.search(search,method)
		if method == "1"
		@books = Book.where("title LIKE?","#{search}%")
		elsif method == "2"
		@books = Book.where("title LIKE?","%#{search}")
		elsif method == "3"
		@books = Book.where("title LIKE?","#{search}")
		elsif method == "4"
		@books = Book.where("title LIKE?","%#{search}%")
		else
		@books = Book.all
		end
	end
end
