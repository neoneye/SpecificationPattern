Pod::Spec.new do |s|
  s.name         = "SpecificationPattern"
  s.version      = "0.9.0"
  s.summary      = "The Specification pattern implemented in swift"
  s.description  = <<-DESC
                   Business logic is the heartbeat of our applications.
                   It is what makes your application worth something to the business.
                   This simple pattern takes the complex business logic and turn it
                   into a more manageable and readable piece of art.
                   DESC
  s.homepage     = "https://github.com/neoneye/SpecificationPattern"
  s.screenshots  = "https://raw.githubusercontent.com/neoneye/SpecificationPattern/master/example0.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Simon Strandgaard" => "neoneye@gmail.com" }
  s.social_media_url   = "http://twitter.com/neoneye"
  s.source       = { :git => "https://github.com/neoneye/SpecificationPattern.git", :tag => s.version }
  s.source_files = "Classes/*.swift"
  s.requires_arc = true
end
