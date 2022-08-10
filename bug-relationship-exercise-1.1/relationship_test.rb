require "minitest/autorun"
require_relative "bug"
require_relative "relationship"

#
# === "A Bug's Life" relationships Exercise ====
#
# This exercise will augment the previous "A Bug's Life" exercise
# with the notion of relationships between bugs!
#
# Below are a couple of tests. They don't run because the described
# class (Relationship) is not implemented. It's your task to make them pass!
#
# Note: Some tests also require you to change the original Bug class.
#

class RelationshipTest < Minitest::Test
  def self.test_order
    :sorted
  end

  # This special setup method is automatically run by Minitest before every
  # test that is executed. This helps with setting up your test environment
  # and reduces code duplication.
  def setup
    @father_relationship = Relationship.new("father")

    @father_bug = Bug.new("Harry")
    @child_bug = Bug.new("Larry")

    @father_relationship.bug1 = @father_bug
    @father_relationship.bug2 = @child_bug
  end

  # This tests basic attributes of a relationship: the kind (e.g. 'father' or
  # 'mother') and the two bugs that are part of the relationship.
  def test_1_relationship_attributes
    # remove this line when you want to work on this test
    assert_equal("father", @father_relationship.kind)
    assert_equal(@father_bug, @father_relationship.bug1)
    assert_equal(@child_bug, @father_relationship.bug2)
  end

  # This tests a method that returns a textual description of a relationship.
  def test_2_relationship_description
    # remove this line when you want to work on this test
    assert_equal("Harry is Larry's father", @father_relationship.description)
  end

  # So far, the bugs "know" nothing about their relationships. Let's change that
  # by making this test pass!
  def test_3_bug_has_relationships
    # remove this line when you want to work on this test
    assert_includes(@father_bug.relationships, @father_relationship)
    assert_includes(@child_bug.relationships, @father_relationship)
  end

  # The bugs that form part of the relationships now get a method that returns
  # a textual summary of their relationships.
  def test_4_bug_relationship_summary
    # remove this line when you want to work on this test
    mother_relationship = Relationship.new("mother")

    mother_bug = Bug.new("Carrie")

    mother_relationship.bug1 = mother_bug
    mother_relationship.bug2 = @child_bug

    assert_equal("Harry is Larry's father", @father_bug.relationship_summary)
    assert_equal("Harry is Larry's father and Carrie is Larry's mother", @child_bug.relationship_summary)
    assert_equal("Carrie is Larry's mother", mother_bug.relationship_summary)
  end
end
