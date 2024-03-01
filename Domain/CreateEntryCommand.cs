namespace WebClient.Domain
{
    public class CreateEntryCommand
    {
        public DateTime? Timestamp { get; set; }
        public decimal? Weight { get; set; }
        public string? Notes { get; set; }
    }
}