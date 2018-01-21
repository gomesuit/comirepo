# == Schema Information
#
# Table name: footer_ads
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  dom        :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FooterAd < ApplicationRecord
end
