class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in: %w(Non-Fiction Fiction),message:"is not included in the list"} 

    validate :title_is_click_bait

    def title_is_click_bait
        if title
          if ["won't believe","secret","top [0-9]","guess"].map{|test| title.downcase.scan(/#{test}/).first}.all?{|x| x.nil?}
            errors.add :title, "Your title: #{self.title} is not click bait"
           end
      end
    end

end
