FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    content { "Sample Content" }
    slug { generate(:slug) }
  end
end
