
module NcrnaDB

	class GenomeDb < DBConnection
		set_primary_key 'genome_db_id'
		has_many :members
	end
	
	class Member < DBConnection
		set_primary_key 'member_id'
		belongs_to :genome_db, :foreign_key => 'genome_db_id'
		has_many :peptide_members
		has_many :xref_ncrna_members
		has_one :homology_group
		has_many :homology_members
	end
	
	class PeptideMember < DBConnection
		set_primary_key 'peptide_member_id'
		belongs_to :member, :foreign_key => "member_id"	
		has_many :xref_ncrna_peptide_members
		has_many :homology_members
	end
	
	class Ncrna < DBConnection
		set_primary_key 'ncrna_id'
		has_many :xref_ncrna_members
		has_many :xref_ncrna_peptide_members
	end
	
	class XrefNcrnaMember < DBConnection
		set_primary_keys :ncrna_id,:member_id
		belongs_to :ncrna, :foreign_key => "ncrna_id"
		belongs_to :member, :foreign_key => "member_id"
	end
	
	class XrefNcrnaPeptideMember < DBConnection
		set_primary_keys :ncrna_id,:peptide_member_id
		belongs_to :ncrna, :foreign_key => "ncrna_id"
		belongs_to :peptide_member, :foreign_key => "peptide_member_id"
	end
	
	class HomologyGroup < DBConnection
		set_primary_key :homology_group_id
		belongs_to :member, :foreign_key => "member_id"
		belongs_to :peptide_member, :foreign_key => "peptide_member_id"
		has_many :homology_members
	end
	
end
