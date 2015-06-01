
<% if @is_mobile %>
    <% if @bodyId == 'home' %>
        <meta name="viewport" content="width=1600" />
    <% else %>
        <meta name="viewport" content="width=1120" />
    <% end %>
<% end %>
<%= stylesheet_link_tag "core.css", :media => "all" %>
<%= csrf_meta_tags %>
