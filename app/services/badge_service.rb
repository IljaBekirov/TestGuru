# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each { |badge| add_badge(badge) if send(badge.rule_type.to_s, badge.condition.to_i) }
  end

  private

  def add_badge(badge)
    @test_passage.user.badges << badge
    @test_passage.badges << badge
  end

  def first_attempt(condition)
    test_passages = TestPassage.where(user_id: @test_passage.user, test_id: @test_passage.test_id)
    test_passages.count == condition && condition == test_passages.where(pass: true).count
  end

  def all_level(condition)
    return false unless @test_passage.test.level == condition

    @test_passage.user.tests.where(level: condition).uniq.count == Test.where(level: condition).count
  end

  def all_categories(condition)
    return false unless @test_passage.test.category_id == condition

    @test_passage.user.tests.where(category_id: condition).uniq.count == Test.where(category_id: condition).count
  end
end
