# frozen_string_literal: true

Given('User navigates to demoblaze page') do
  page.windows[0].maximize
  visit "#{URL_DEMOZABLE}"
end