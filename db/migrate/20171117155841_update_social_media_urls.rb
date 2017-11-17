class UpdateSocialMediaUrls < ActiveRecord::Migration
  def change
    Organization.find_each do |org|
      org.update(
        :twitter => makeValidUrl(org.twitter, 'twitter'),
        :facebook => makeValidUrl(org.facebook, 'facebook'),
        :linkedin => makeValidUrl(org.linkedin, 'linkedin')
      )
      org.save!
    end
  end

  def makeValidUrl(item, type)
    validProtocols = ['http:', 'https:']
    invalidEntries = ['NA', 'n/a', 'N/A']
    if (item)
      if (!validProtocols.include?(item.split('//')[0]))
        if (invalidEntries.include?(item))
          item = nil
        elsif (item.chr === "@")
          item.slice!(0)
          item = 'http://' + type + '.com/' + item
        else
          item = 'http://' + item
        end
      end
    end
    item
  end

end
