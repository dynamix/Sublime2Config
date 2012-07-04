require 'appscript'
include Appscript
iterm = app 'iTerm'

cmd,title = *ARGV

session = nil
sessions = iterm.terminals.sessions[ its.name.contains( title ) ]
if sessions.count > 0
  session = sessions
else
 iterm.current_terminal.make new: :session
 session = iterm.current_terminal.sessions.last
 session.name.set title
 session.exec command: 'bash'
end
session.write text: cmd

