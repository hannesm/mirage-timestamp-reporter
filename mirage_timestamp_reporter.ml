module Make (P : Mirage_clock_lwt.PCLOCK) = struct
  let create ?(dst = Fmt.stdout) () =
    let pp_header ppf data =
      let tz_offset_s = P.current_tz_offset_s ()
      and now = Ptime.v (P.now_d_ps ())
      in
      Fmt.pf ppf "%a %a " (Ptime.pp_rfc3339 ?tz_offset_s ()) now
        Logs_fmt.pp_header data
    in
    Logs_fmt.reporter ~pp_header ~dst ~app:dst ()
end
