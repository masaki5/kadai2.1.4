class Relation < ApplicationRecord

  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
  #class_name: ‘User’ と補足設定することで、Followクラスという存在しないクラスを参照することを防ぎ、User クラスであることを明示しています
  validates :follower_id, presence: true
  validates :following_id, presence: true
end
