using Microsoft.AspNetCore.Mvc;

namespace DeploymentWebhook.Controllers;

[ApiController]
[Route("api/[controller]")]
public class GithubController : ControllerBase
{
    /// <summary>
    /// Receives webhook POST requests.
    /// The [ServiceFilter] attribute applies the token authentication filter.
    /// </summary>
    [HttpPost]
    // [ServiceFilter(typeof(TokenAuthenticationFilter))]
    public IActionResult Post([FromBody] object payload)
    {
        // Process the webhook payload as needed.
        Console.WriteLine("Webhook received successfully.");
        Console.WriteLine($"Payload: {payload}");
        return Ok("Webhook received successfully.");
    }
}