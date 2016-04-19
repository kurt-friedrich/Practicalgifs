class Gif < ActiveRecord::Base
  attachment :cv, extension: "gif"
  attachment :gif, content_type: "image/gif"
  belongs_to :user
  has_many :votes

  validates :url, allow_blank: true,
                  format: { with: URI.regexp, message: 'must be a valid URL like http://media.giphy.com/media/tlpVdqCrewXFC/giphy.gif'}, if: Proc.new { |a| a.url.present? }
  validates :url, allow_blank: true, format: { with: %r{.(gif)\Z}i, message: 'must be a GIF like http://media.giphy.com/media/tlpVdqCrewXFC/giphy.gif.' }

  validate :gif_present

  def gif_present
    if [self.url, self.gif].count(&:blank?) == 2
      errors[:base] << "Please upload either a gif URL or a file."
    end
  end

end
