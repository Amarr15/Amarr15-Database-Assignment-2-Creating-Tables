namespace BidNile.DSA;

public class ProductExceptSelfSolution
{
    /// <summary>
    /// 5.1 — Solution with prefix[] and suffix[] arrays.
    /// 
    /// Time Complexity:  O(n) - We do three linear passes over the array of size n.
    /// Space Complexity: O(n) - We allocate two additional arrays of size n: prefix[] and suffix[].
    /// </summary>
    public int[] ProductExceptSelf_PrefixSuffix(int[] nums)
    {
        int n = nums.Length;
        int[] prefix = new int[n];
        int[] suffix = new int[n];
        int[] result = new int[n];

        // prefix[i] contains the product of all elements to the left of i
        prefix[0] = 1;
        for (int i = 1; i < n; i++)
        {
            prefix[i] = prefix[i - 1] * nums[i - 1];
        }

        // suffix[i] contains the product of all elements to the right of i
        suffix[n - 1] = 1;
        for (int i = n - 2; i >= 0; i--)
        {
            suffix[i] = suffix[i + 1] * nums[i + 1];
        }

        // For each index i, product except self is prefix[i] * suffix[i]
        for (int i = 0; i < n; i++)
        {
            result[i] = prefix[i] * suffix[i];
        }

        return result;
    }

    /// <summary>
    /// 5.2 — Follow-up: O(1) extra space (output array does not count towards space complexity).
    /// 
    /// Time Complexity:  O(n) - Two passes over the array of size n.
    /// Space Complexity: O(1) - Uses only one integer variable (suffix) for running product;
    ///                          the result array does not count as extra space per problem description.
    /// </summary>
    public int[] ProductExceptSelf(int[] nums)
    {
        int n = nums.Length;
        int[] result = new int[n];

        // Step 1: Calculate prefix products directly in the result array
        result[0] = 1;
        for (int i = 1; i < n; i++)
        {
            result[i] = result[i - 1] * nums[i - 1];
        }

        // Step 2: Multiply by running suffix product from right to left
        int suffix = 1;
        for (int i = n - 1; i >= 0; i--)
        {
            result[i] *= suffix;
            suffix *= nums[i];
        }

        return result;
    }
}
