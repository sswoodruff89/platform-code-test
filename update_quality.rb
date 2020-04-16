require 'award'

def update_quality(awards)
  awards.each do |award| 
      
    if award.name != 'Blue First' &&
        award.name != 'Blue Compare' && 
          award.name != 'Blue Star'

      if award.name != 'Blue Distinction Plus'
          award.quality = [award.quality - 1, 0].max
      end

    else
      
      if award.name == 'Blue Compare'
        award.quality += (award.expires_in <= 5) ? 2 
        : (award.expires_in <= 10) ? 1 
          : 0
      end
    
      if award.name == 'Blue Star'
        award.quality = [award.quality - 2, 0].max
      else
        award.quality = [50, award.quality + 1].min
      end

    end

    if award.name != 'Blue Distinction Plus'
      award.expires_in -= 1
    end

    if award.expires_in < 0

      if award.name != 'Blue First' &&
        award.name != 'Blue Compare' && 
          award.name != 'Blue Distinction Plus' &&
            award.name != 'Blue Star'

        award.quality = [award.quality - 1, 0].max       

      elsif award.name == 'Blue Compare'
        award.quality = award.quality - award.quality
      elsif award.name == 'Blue First'
        award.quality = [50, award.quality + 1].min
      elsif award.name == 'Blue Star'
        award.quality = [award.quality - 2, 0].max
      end
    end

  end
end

