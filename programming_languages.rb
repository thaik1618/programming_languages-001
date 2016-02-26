require 'pry'

def reformat_languages(languages)
  new_hash = {}
  languages.each do |style, values|
    values.each do |name, type|
      new_hash[name] = {:type => "", :style => []}
      new_hash[name][:type] = type[:type]
    end
  end
  languages.each do |style, values|
    i = 0
    new_hash.each do |lang, attrb|
      if values.keys[i] == lang
        attrb[:style] << style
        i += 1
      else
        nil
      end
    end
  end
    languages.each do |style, values|
    i = values.keys.length - 1
    new_hash.each do |lang, attrb|
      if values.keys[i] == lang
        attrb[:style] << style
        i -= 1
      else
        nil
      end
      attrb[:style].uniq!
    end
  end
  new_hash
end

languages = {
  :oo => {
    :ruby => {
      :type => "interpreted"
    },
    :javascript => {
      :type => "interpreted"
    },
    :python => {
      :type => "interpreted"
    },
    :java => {
      :type => "compiled"
    }
  },
  :functional => {
    :clojure => {
      :type => "compiled"
    },
    :erlang => {
      :type => "compiled"
    },
    :scala => {
      :type => "compiled"
    },
    :javascript => {
      :type => "interpreted"
    }
 
  }
}

puts reformat_languages(languages)
