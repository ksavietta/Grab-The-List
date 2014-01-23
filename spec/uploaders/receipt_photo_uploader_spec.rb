require 'spec_helper'
# Use Carrierwave's provided test matchers
require 'carrierwave/test/matchers'

describe ReceiptPhotoUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    ReceiptPhotoUploader.new(FactoryGirl.build(:purchase),
      :receipt_photo)
  end

  let(:path) do
    Rails.root.join('spec/file_fixtures/valid_car_image.png')
  end

  before do
    ReceiptPhotoUploader.enable_processing = true
  end

  after do
    ReceiptPhotoUploader.enable_processing = false
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end
end