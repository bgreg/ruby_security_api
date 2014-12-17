require 'rails_helper'

describe Exposure do
  
  context 'scopes' do
    let(:a_non_ruby_exposure)    { create(:exposure, published: 1.day.ago ) }
    let(:a_recent_ruby_exposure) { create(:exposure, :ruby, published: 29.days.ago) }
    let(:a_older_ruby_exposure)  { create(:exposure, :ruby, published: 31.days.ago) }

    context ':ruby-true' do
      subject { Exposure.ruby_true } 

      it { is_expected.to include(a_recent_ruby_exposure)  }
      it { is_expected.to_not include(a_non_ruby_exposure) }
    end

    context ':recent' do
      subject { Exposure.recent } 

      it { is_expected.to include(a_recent_ruby_exposure)     }
      it { is_expected.to_not include(a_older_ruby_exposure)  }
    end

    context ':others' do
      subject { Exposure.others }

      it { is_expected.to include(a_older_ruby_exposure)      }
      it { is_expected.to_not include(a_recent_ruby_exposure) }
    end

  end
end
