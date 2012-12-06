module Helpers

    def pause message=''
        puts "Press any key to continue... #{message}"
        STDIN.getc
    end
end