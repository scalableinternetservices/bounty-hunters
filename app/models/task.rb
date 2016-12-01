class Task < ActiveRecord::Base
    belongs_to :owner, class_name: 'User', :foreign_key => :owner_id
    belongs_to :claimer, class_name: 'User', :foreign_key => :claimer_id
    belongs_to :completer, class_name: 'User', :foreign_key => :completer_id
    
    serialize :tags
    validates :name, length: { in: 1..50 }
    validates :description, length: { in: 1..1000 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    
    def self.search(search, page)
        self.where("tags LIKE '%#{search}%'")
        .paginate(:page => page, :per_page => 5).order('tags ASC')
    end
    
    # unsure of gmaps api if we ever add but something like this
    #has_one :location, class_name: 'Address'
    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
