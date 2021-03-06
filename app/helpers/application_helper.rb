# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'ibekirov', "https://github.com/#{author}/#{repo}", target: '_blank', class: 'text-white'
  end

  def button_back(url)
    link_to 'Назад', url, class: 'btn btn-outline-danger'
  end
end
