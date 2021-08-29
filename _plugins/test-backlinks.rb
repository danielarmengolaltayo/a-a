# Jekyll::Hooks.register :site, :post_render do |site|
    
#     all_notes = site.collections['notes'].docs
#     all_pages = site.pages

#     all_docs = all_notes + all_pages

#     link_extension = !!site.config["use_html_extension"] ? '.html' : ''

#     # Convert all Wiki/Roam-style double-bracket link syntax to plain HTML
#     # anchor tag elements (<a>) with "internal-link" CSS class
#     all_docs.each do |current_note|
#       all_docs.each do |note_potentially_linked_to|
#         title_from_filename = File.basename(
#           note_potentially_linked_to.basename,
#           File.extname(note_potentially_linked_to.basename)
#         ).gsub('_', ' ').gsub('-', ' ').capitalize

#         # Replace ?? links using note filename
#         # per a mantenir la possibilitat de navegar els links correctament dins de foam
#         # alhora que puc posar el text que vulgui a la web
#         # [this is a link to the note about cats]([[cats]])
#         current_note.content = current_note.content.gsub(
#           /\[([^\]]+?)(?=\])\]\(\[\[(#{title_from_filename})\]\]\)/i,
#           "<a class='internal-link' id='#{current_note.url}#{note_potentially_linked_to.url}' href='#{site.baseurl}#{note_potentially_linked_to.url}#{link_extension}'>\\1</a>"
#         )

#       end

#     #   # At this point, all remaining double-bracket-wrapped words are
#     #   # pointing to non-existing pages, so let's turn them into disabled
#     #   # links by greying them out and changing the cursor
#     #   current_note.content = current_note.content.gsub(
#     #     /\[\[(.*)\]\]/i, # match on the remaining double-bracket links
#     #     <<~HTML.chomp    # replace with this HTML (\\1 is what was inside the brackets)
#     #       <span title='There is no note that matches this link.' class='invalid-link'>
#     #         <span class='invalid-link-brackets'>[[</span>
#     #         \\1
#     #         <span class='invalid-link-brackets'>]]</span></span>
#     #     HTML
#     #   )
#     end

    

#   end

# Jekyll::Hooks.register :site, :pre_render do |site|

#     all_notes = site.collections['notes'].docs

#     # Identify note backlinks and add them to each note
#     all_notes.each do |current_note|
#         notes_linking_to_current_note = all_notes.filter do |e|
#           # avoid backlinks to the same note (e.url != current_note.url)
#           e.content.include?(current_note.url) && e.url != current_note.url 
#         end
#         current_note.data['backlinks'] = notes_linking_to_current_note
#       end
  
#       # Identify links to other notes and add them to each note
#       all_notes.each do |current_note|
#         links_to_other_notes = all_notes.filter do |e|
#           # current_note.content.include?(e.url)
#           current_note.content.include?(e.url) || e.content.include?(current_note.url)
#         end
#         current_note.data['links'] = links_to_other_notes
#       end

# end