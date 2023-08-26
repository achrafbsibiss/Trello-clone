require 'rails_helper'

RSpec.describe Itme, type: :model do
  it { is_expected.to belong_to :list }
  it { is_expected.to validate_presence_of :title}

end
