# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "Автор проекта #{repo}: Бекиров Илья", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def button_back(url)
    link_to 'Назад', url
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
