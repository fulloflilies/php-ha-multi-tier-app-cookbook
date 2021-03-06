require_relative '../spec_helper'

describe 'w_haproxy::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['monit_enabled'] = true
    end.converge(described_recipe)
  end
  
  before do
    stub_data_bag_item("w_haproxy", "cert").and_return('id' => 'cert', 'cert_key' => '-----BEGIN PRIVATE KEY-----MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDY9V/LcJoyCKYDV/cHafAedczyFrgW+c0ni3bsk/yMPo8pQUNKtlF+Ap6pvGiONyEfRnNGvKEAeCGgmIHfXNJixScUA7GC5KbJhIh2lIfo3J4z52dLU/iihzaof88VRejl8DpbY1jrLecQXELbutp2GqWsT4xl+jOc8JjUfZqRPfk6wk7aoMbhx5hSf4W+/7TtqMWFohtO8rUTLR6wAAtYNW5AiL/+l1lPgVciK8NbPj4T689GUAMN814VdMB0RRwASEtHUad82UFBT1IFHpwPno8WZNb/xOt2rvFPhqAzEyBzBXPGt2qQ3fK0lR11B525PrPQQeJ7MCV+hLv9FGa5AgMBAAECggEAQh3k55aVJxJDpVk1SukZ5+52WoBZ8YaG4ro5r7cZi5O1BRmCbE5LX19lAs0L/+sFCQbrMm9hkUcK2GohifQ7mSYD1rGZcw5DVb4x6BEzqd8xxxeJ/wbECqOyIH9ymEUJyKkA38DS5DjE5dN3/IZg9QUB4BUN8DXjbLxVlswAQqpUb1B6lmKXps02jqIs0OHJQ/qw0Cq3NYw4ljNZdDOgjIVCiKfktxHEad0/5rrG+BuRCHL7ohetO4a2OCAyQkVKNbdkFi0JwRiXpI10HS8UeB2QDpL2KfEvclPcAeLIs62kDD7j71dv0pEUa9xdpzG0T6T6oRnmF4hmRH+XWc2UAQKBgQD3Ms7JWIQUSHK5vMQdIcIOJRwvJxUNQSHd2zJkRcVxKaeRi+eH+2kSK71yDydl1bEVbLFvA9IM85r27jNrVd1ybXqw0qBcY1zIcw85apQmQsBLG5Xp+V2ZxhOAJ1QxQhqoZsOUtZDVZSFPEuNJL3bXRI3G7SMU8qV15VaB/z2z4QKBgQDgru6GFjidWsTUYj7thdPZrHPqXf44P0zkG62ersPzIvGL7Y/E0WpS4rs1DvvH+eflLes2Gb1kp7PMU9SoMt4/dB9BlO2XAXYAjwSp38Sh54DlvY0VXUQuHQ5P6RjQyZ13DK5cMVuBghEl5rJFbye5xj97pwXlJrwJnr7QnDSN2QKBgFb2+Oi8yzqXgkT1s8jL54kyZQfxp+ZR06hJRSEhqqR1Ew6ROZMNT5mk6bEGw8V/uBzhcEqt/WexDANzKYPJYW6wNUmfz+qwyiN61xBL/nK3aQ8DVWpK4DMJDDM5otTxfI9iF8xpU9q/CUjYTD2jBRwWcgpZws3Lz4n6dMSnFv4BAoGAJ3v2ZM/w4Q47estNHbaf9SfOMwiTjVTqcUe/6hvySX8BjcKQuljG44v+tCNO8eSj8O1x4U8CrnaeLTEqNOjDj8kbWQ4P9rKGBzEa87NkPcOOLlFyQqfiPGxUwIxJFR/pMSukVIVD/G1cEBoLiBIxm/8P1u4SJiP5dYNVKxnYTnkCgYADf3INKrT6lpFDvcUP1UMDEKRyAH23SN+z5BmU9RMaTHCBfr28vNT+u3GE/mgbF84ISBGo3IJENoqRn9hvpj9RhIdG9P44MH/2I+notTwvoTpOMVsx0LTIlwG4Ar0/hQP1vLEeo4lNWHaUqOCdDlSKyGRlKf+nA72uPyfSOagJIw==-----END PRIVATE KEY----------BEGIN CERTIFICATE-----MIICxjCCAa4CCQDZnInFOXmTJTANBgkqhkiG9w0BAQUFADAlMSMwIQYDVQQDExowd2ViYXBwLmV4YW1wbGV3ZWJzaXRlLmNvbTAeFw0xNTA2MjMxOTI4MjRaFw0yNTA2MjAxOTI4MjRaMCUxIzAhBgNVBAMTGjB3ZWJhcHAuZXhhbXBsZXdlYnNpdGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2PVfy3CaMgimA1f3B2nwHnXM8ha4FvnNJ4t27JP8jD6PKUFDSrZRfgKeqbxojjchH0ZzRryhAHghoJiB31zSYsUnFAOxguSmyYSIdpSH6NyeM+dnS1P4ooc2qH/PFUXo5fA6W2NY6y3nEFxC27radhqlrE+MZfoznPCY1H2akT35OsJO2qDG4ceYUn+Fvv+07ajFhaIbTvK1Ey0esAALWDVuQIi//pdZT4FXIivDWz4+E+vPRlADDfNeFXTAdEUcAEhLR1GnfNlBQU9SBR6cD56PFmTW/8Trdq7xT4agMxMgcwVzxrdqkN3ytJUddQeduT6z0EHiezAlfoS7/RRmuQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQALaK/KkGCxal9UIpPNaqApkTmbZiOnieL48ZgyInXTQSy7UBw2N56IMnWRHyHcZRaThfVVshQicgQdQ2tlPC3dYU6Eru8oUpYXJyW6gfuigC+vcUk9XoPuBTSVmBrmMOIqUlei6C6zKVZ7LyYM9QVt+spBJHvNEZpeCaDxPfV+b1gkM1kgbLZreBaYKS+2sITM5b2+sOqmxsQyEihHiY+wds21oJ2/zZUhl0Cmb9c4J9jSI0K4AyHR2S0RXSQZj3OfjhzSx83cEgYHy6QXhwhV+EgB9NnO++jDtgF0a5ko/NFqG+fHPMR5h7fnEc+N9gsfcTDIbn0+q/2+PFZUn0Er-----END CERTIFICATE-----')
  end

  it 'creates /etc/ssl/private/examplewebsite.com.pem' do
    expect(chef_run).to create_file('/etc/ssl/private/examplewebsite.com.pem').with_content('-----BEGIN PRIVATE KEY-----MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDY9V/LcJoyCKYDV/cHafAedczyFrgW+c0ni3bsk/yMPo8pQUNKtlF+Ap6pvGiONyEfRnNGvKEAeCGgmIHfXNJixScUA7GC5KbJhIh2lIfo3J4z52dLU/iihzaof88VRejl8DpbY1jrLecQXELbutp2GqWsT4xl+jOc8JjUfZqRPfk6wk7aoMbhx5hSf4W+/7TtqMWFohtO8rUTLR6wAAtYNW5AiL/+l1lPgVciK8NbPj4T689GUAMN814VdMB0RRwASEtHUad82UFBT1IFHpwPno8WZNb/xOt2rvFPhqAzEyBzBXPGt2qQ3fK0lR11B525PrPQQeJ7MCV+hLv9FGa5AgMBAAECggEAQh3k55aVJxJDpVk1SukZ5+52WoBZ8YaG4ro5r7cZi5O1BRmCbE5LX19lAs0L/+sFCQbrMm9hkUcK2GohifQ7mSYD1rGZcw5DVb4x6BEzqd8xxxeJ/wbECqOyIH9ymEUJyKkA38DS5DjE5dN3/IZg9QUB4BUN8DXjbLxVlswAQqpUb1B6lmKXps02jqIs0OHJQ/qw0Cq3NYw4ljNZdDOgjIVCiKfktxHEad0/5rrG+BuRCHL7ohetO4a2OCAyQkVKNbdkFi0JwRiXpI10HS8UeB2QDpL2KfEvclPcAeLIs62kDD7j71dv0pEUa9xdpzG0T6T6oRnmF4hmRH+XWc2UAQKBgQD3Ms7JWIQUSHK5vMQdIcIOJRwvJxUNQSHd2zJkRcVxKaeRi+eH+2kSK71yDydl1bEVbLFvA9IM85r27jNrVd1ybXqw0qBcY1zIcw85apQmQsBLG5Xp+V2ZxhOAJ1QxQhqoZsOUtZDVZSFPEuNJL3bXRI3G7SMU8qV15VaB/z2z4QKBgQDgru6GFjidWsTUYj7thdPZrHPqXf44P0zkG62ersPzIvGL7Y/E0WpS4rs1DvvH+eflLes2Gb1kp7PMU9SoMt4/dB9BlO2XAXYAjwSp38Sh54DlvY0VXUQuHQ5P6RjQyZ13DK5cMVuBghEl5rJFbye5xj97pwXlJrwJnr7QnDSN2QKBgFb2+Oi8yzqXgkT1s8jL54kyZQfxp+ZR06hJRSEhqqR1Ew6ROZMNT5mk6bEGw8V/uBzhcEqt/WexDANzKYPJYW6wNUmfz+qwyiN61xBL/nK3aQ8DVWpK4DMJDDM5otTxfI9iF8xpU9q/CUjYTD2jBRwWcgpZws3Lz4n6dMSnFv4BAoGAJ3v2ZM/w4Q47estNHbaf9SfOMwiTjVTqcUe/6hvySX8BjcKQuljG44v+tCNO8eSj8O1x4U8CrnaeLTEqNOjDj8kbWQ4P9rKGBzEa87NkPcOOLlFyQqfiPGxUwIxJFR/pMSukVIVD/G1cEBoLiBIxm/8P1u4SJiP5dYNVKxnYTnkCgYADf3INKrT6lpFDvcUP1UMDEKRyAH23SN+z5BmU9RMaTHCBfr28vNT+u3GE/mgbF84ISBGo3IJENoqRn9hvpj9RhIdG9P44MH/2I+notTwvoTpOMVsx0LTIlwG4Ar0/hQP1vLEeo4lNWHaUqOCdDlSKyGRlKf+nA72uPyfSOagJIw==-----END PRIVATE KEY----------BEGIN CERTIFICATE-----MIICxjCCAa4CCQDZnInFOXmTJTANBgkqhkiG9w0BAQUFADAlMSMwIQYDVQQDExowd2ViYXBwLmV4YW1wbGV3ZWJzaXRlLmNvbTAeFw0xNTA2MjMxOTI4MjRaFw0yNTA2MjAxOTI4MjRaMCUxIzAhBgNVBAMTGjB3ZWJhcHAuZXhhbXBsZXdlYnNpdGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2PVfy3CaMgimA1f3B2nwHnXM8ha4FvnNJ4t27JP8jD6PKUFDSrZRfgKeqbxojjchH0ZzRryhAHghoJiB31zSYsUnFAOxguSmyYSIdpSH6NyeM+dnS1P4ooc2qH/PFUXo5fA6W2NY6y3nEFxC27radhqlrE+MZfoznPCY1H2akT35OsJO2qDG4ceYUn+Fvv+07ajFhaIbTvK1Ey0esAALWDVuQIi//pdZT4FXIivDWz4+E+vPRlADDfNeFXTAdEUcAEhLR1GnfNlBQU9SBR6cD56PFmTW/8Trdq7xT4agMxMgcwVzxrdqkN3ytJUddQeduT6z0EHiezAlfoS7/RRmuQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQALaK/KkGCxal9UIpPNaqApkTmbZiOnieL48ZgyInXTQSy7UBw2N56IMnWRHyHcZRaThfVVshQicgQdQ2tlPC3dYU6Eru8oUpYXJyW6gfuigC+vcUk9XoPuBTSVmBrmMOIqUlei6C6zKVZ7LyYM9QVt+spBJHvNEZpeCaDxPfV+b1gkM1kgbLZreBaYKS+2sITM5b2+sOqmxsQyEihHiY+wds21oJ2/zZUhl0Cmb9c4J9jSI0K4AyHR2S0RXSQZj3OfjhzSx83cEgYHy6QXhwhV+EgB9NnO++jDtgF0a5ko/NFqG+fHPMR5h7fnEc+N9gsfcTDIbn0+q/2+PFZUn0Er-----END CERTIFICATE-----')
  end
  
  it 'runs recipe haproxy::manual' do
    expect(chef_run).to include_recipe('haproxy::manual')
  end  

  it 'creates a haproxy config /usr/local/etc/haproxy/haproxy.cfg' do
    expect(chef_run).to create_haproxy_config('Create haproxy.cfg')
  end
    
  it 'enables firewall' do
  	expect(chef_run).to enable_firewall('ufw')
  end

  [80, 443, 22002].each do |listen_port|
  	it "runs resoruce firewall_rule to open port #{listen_port}" do
    	expect(chef_run).to allow_firewall_rule("listen port #{listen_port}").with(port: listen_port, protocol: :tcp)
    end
  end
    
  it 'runs recipe w_haproxy::monit' do
    expect(chef_run).to include_recipe('w_haproxy::monit')
  end
  
end