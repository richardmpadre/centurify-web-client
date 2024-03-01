namespace WebClient.Domain
{
    public class Entry
    {
        public int Id { get; set; }
        public DateTime? Timestamp { get; set; }
        public decimal? Weight { get; set; }
        public string? Notes { get; set; }
    }
}
