class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :book
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :following_relations, foreign_key: "follower_id", class_name: "Relation", dependent: :destroy
  has_many :followings, through: :following_relations
  has_many :follower_relations, foreign_key: "following_id", class_name: "Relation", dependent: :destroy
  has_many :followers, through: :follower_relations


  attachment :profile_image, destroy: false

  

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }

  #user.rbにフォローする関数、フォローしているか調べるための関数、フォローを外す関数を作成する
  def following?(other_user)
    following_relations.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relations.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relations.find_by(following_id: other_user.id).destroy
  end

  def self.search(search,method)
		if method == "1"
		@users = User.where("name LIKE?","#{search}%")
		elsif method == "2"
		@users = User.where("name LIKE?","%#{search}")
		elsif method == "3"
		@users = User.where("name LIKE?","#{search}")
		elsif method == "4"
		@users = User.where("name LIKE?","%#{search}%")
		else
		@users = User.all
		end
	end

end
