defmodule IPv4 do
  def parse(packet) do
    <<
        version         :: size(4),
        ihl             :: size(4),
        dscp            :: size(6),
        ecn             :: size(2),
        total_length    :: size(16),
        identification  :: size(16),
        flags           :: size(3),
        fragment_offset :: size(13),
        ttl             :: size(8),
        protocol        :: size(8),
        header_checksum :: size(16),
        source_ip       :: binary-size(4),
        destination_ip  :: binary-size(4),
        _rest           :: bitstring >> = packet
    # IO.puts "Protocol version is: #{version}"
    # IO.puts "Internet Header Length: #{ihl}"
    # IO.puts "DSCP: #{dscp}"
    # IO.puts "ECN: #{ecn}"
    # IO.puts "Total Length: #{total_length}"
    # IO.puts "Identification: #{identification}"
    # IO.puts "Flags: #{flags}"
    # IO.puts "Fragment Offset: #{fragment_offset}"
    # IO.puts "TTL: #{ttl}"
    # IO.puts "Protocol: #{protocol}"
    # IO.puts "Header Checksum: #{header_checksum}"
    # IO.write "Source IP: "
    # inet4_to_dotted(source_ip)
    # IO.write "Destination IP: "
    # inet4_to_dotted(destination_ip)

    %{
      version:          version,
      ihl:              ihl,
      dscp:             dscp,
      ecn:              ecn,
      total_length:     total_length,
      identification:   identification,
      flags:            flags,
      fragment_offset:  fragment_offset,
      ttl:              ttl,
      protocol:         protocol,
      header_checksum:  header_checksum,
      source_ip:        inet4_to_dotted(source_ip),
      destination_ip:   inet4_to_dotted(destination_ip)
    }
  end

  def inet4_to_dotted(ip) do
    <<  first :: size(8), second :: size(8),
        third :: size(8), fourth :: size(8) >> = ip
    "#{first}.#{second}.#{third}.#{fourth}"
  end
end
