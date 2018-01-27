# == Schema Information
#
# Table name: footer_ads
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  dom_pc     :text(65535)      not null
#  dom_sp     :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sort       :integer          default(0), not null
#  hided      :boolean          default(FALSE), not null
#

class FooterAd < ApplicationRecord
  enum hided: { hided: true, displayed: false }
end
