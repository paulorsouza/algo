defmodule PalindromeTest do
  use ExUnit.Case
  import Palindrome

  doctest Palindrome

  test "'aba' is a palindrome" do
    assert palindrome?("aba")
  end

  test "'  aba' is not a palindrome" do
    refute palindrome?("  aba")
  end

  test "'1000000001' is a palindrome" do
    assert palindrome?("1000000001")
  end

  test "'1000000000' is not a palindrome" do
    refute palindrome?("1000000000")
  end

  test "'Fish hsif' is not a palindrome" do
    refute palindrome?("Fish hsif")
  end

  test "'1000000001' is a palindrome with palidrome2" do
    assert palindrome2?("aba")
  end

  test "'  aba' is not a palindrome with palindrome2" do
    refute palindrome2?("  aba")
  end
end
