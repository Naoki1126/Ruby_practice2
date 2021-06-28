class Team
    attr_reader :members

    def initialize(members = [])
        @members = members
    end


    def +(member)
        @members << member
    end


    def -(member)
        @members.delete(member)
    end


    def <<(team)
        fail "error" unless team.repond_to?(:members)
        @members += team.members
    end
end


team_a = Team.new(%w(tanaka sato suzuki))
print team_a.members

team_a + "obokata"
p team_a.members

team_a - "obokata"
p team_a.members