# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[title content user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w(user)
  end

  def self.search(search_value)
    ransack(title_cont: search_value, content_cont: search_value, m: 'or').result
  end

  def display_name
    title
  end
end
