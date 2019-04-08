
module Make (P : Mirage_clock_lwt.PCLOCK) : sig
  val create : ?dst:Format.formatter -> unit -> Logs.reporter
end
