#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) 2012-2024 the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.
#++

class Meeting::Title < ApplicationForm
  include OpenProject::StaticRouting::UrlHelpers

  form do |query_form|
    query_form.group(layout: :horizontal) do |group|
      group.text_field(
        name: :title,
        placeholder: Meeting.human_attribute_name(:title),
        label: Meeting.human_attribute_name(:title),
        visually_hide_label: true,
        required: true,
        autofocus: true
      )

      group.submit(name: :submit, label: I18n.t("button_save"), scheme: :primary)

      group.button(
        name: :cancel,
        scheme: :secondary,
        label: I18n.t(:button_cancel),
        tag: :a,
        data: { 'turbo-stream': true },
        href: OpenProject::StaticRouting::StaticUrlHelpers.new.cancel_edit_meeting_path(@meeting)
      )
    end
  end

  def initialize(meeting:)
    super()
    @meeting = meeting
  end
end
